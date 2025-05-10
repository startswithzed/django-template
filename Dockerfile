FROM python:3.13-slim AS base

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

FROM base AS builder

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl \
  && rm -rf /var/lib/apt/lists/*

# Installs uv to /root/.local/bin
RUN curl -LsSf https://astral.sh/uv/install.sh | sh -s -- --no-modify-path

ENV PATH="/root/.local/bin:${PATH}"

COPY pyproject.toml uv.lock ./
RUN uv sync

FROM base AS final

COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

COPY . .

RUN uv run python manage.py collectstatic --noinput
RUN chmod +x entrypoint.sh

EXPOSE 8000

CMD ["./entrypoint.sh"]