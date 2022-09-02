defmodule BaseProj.Uniform.Blueprint do
  use Uniform.Blueprint, templates: "lib/base_proj/uniform/templates"

  base_files do
    cp_r "assets"
    cp_r "priv/static"

    file "lib/base_proj_web.ex"
    file "config/**/*.exs"
    file "test/support/*_case.ex"
  end

  deps do
    # Always eject the `base_proj` and `base_proj_web` libraries.
    #
    # Their paths and file contents will replace base_proj with the ejected
    # app name automatically.
    always do
      mix :phoenix
      mix :phoenix_ecto
      mix :ecto_sql
      mix :phoenix_html
      mix :phoenix_live_reload
      mix :phoenix_live_view
      mix :phoenix_live_dashboard
      mix :esbuild
      mix :gettext
      mix :jason
      mix :plug_cowboy

      lib :base_proj do
        only [
          "lib/base_proj/application.ex",
          "lib/base_proj/repo.ex"
        ]

        # `match_dot: true` so that we eject `priv/repo/.formatter.exs`
        file "priv/repo/**/*.exs", match_dot: true
      end

      lib :base_proj_web do
        only [
          "lib/base_proj_web/endpoint.ex",
          "lib/base_proj_web/gettext.ex",
          "lib/base_proj_web/router.ex",
          "lib/base_proj_web/telemetry.ex",
          "lib/base_proj_web/channels/user_socket.ex",
          "lib/base_proj_web/templates/layout/app.html.heex",
          "lib/base_proj_web/templates/layout/live.html.heex",
          "lib/base_proj_web/templates/layout/root.html.heex",
          "lib/base_proj_web/views/error_helpers.ex",
          "lib/base_proj_web/views/error_view.ex",
          "lib/base_proj_web/views/layout_view.ex"
        ]
      end
    end
  end
end
