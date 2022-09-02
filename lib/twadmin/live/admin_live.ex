defmodule TwadminWeb.AdminLive do
  use BaseProjWeb, :live_view

  alias TweetData.Tweets

  def render(assigns) do
    ~H"""
    <div class="max-w-screen-lg mx-auto grid grid-cols-3 text-gray-100">
      <div class="bg-gray-800 p-8">
        TWADMIN

        <a class="mt-16 block underline text-blue-300 p-2">Home</a>
        <a class="block underline text-amber-300 p-2">Ban a User</a>
      </div>
      <div class="col-span-2">
        <div class="p-4 font-semibold">
          Recent Tweets
        </div>

        <div>
          <%= for {name, handle, date, body} <- Tweets.get_tweets() do %>
            <div class="mb-16 last:mb-0">
              <div class="p-3 bg-gray-800 flex justify-between">
                <div>
                  <strong class="font-semibold text-gray-50"><%= name %></strong>
                  <span class="text-blue-400"><%= handle %></span>
                  <span class="text-gray-400"><%= date %></span>
                </div>
                <button class="text-red-500 underline">DELETE</button>
              </div>
              <div class="p-8">
                <%= body %>
              </div>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
