:application.load(:opentelemetry)
:application.set_env(:opentelemetry, :tracer, :ot_tracer_default)

:application.set_env(:opentelemetry, :processors, [
  {:ot_batch_processor, %{scheduled_delay_ms: 1}}
])

Application.ensure_all_started(:opentelemetry)
Application.ensure_all_started(:telemetry)
OpentelemetryEcto.TestRepo.start_link()

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(OpentelemetryEcto.TestRepo, :manual)
