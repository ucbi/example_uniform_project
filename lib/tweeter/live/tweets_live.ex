defmodule TweeterWeb.TweetsLive do
  use BaseProjWeb, :live_view

  defp tweets do
    [
      {"Amos King", "@adkron", "Aug 29", "What does the evening hold #ElixirConf2022 #ElixirConf?"},
      {"Brian Cardarella", "@bcardarella", "11h", "We just deployed a fix for the #ElixirConf2022 chat app that fixed the user counts. Fixed in 5 minutes, deployed in 1 minute. Already on everyone's phone. That's LiveViewNative"},
      {"todd resudek", "@sprsmpl", "Aug 29", "I've just launched another micro-project. It is called RandomUUID and it generates a random uuidv4. It is available in the browser or as a json API."},
    ]
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-screen-lg mx-auto grid grid-cols-3 bg-gray-700 text-gray-100">
      <div class="bg-gray-800 p-8">
        TWEETER

        <a class="mt-12 block underline text-blue-300 p-2">Home</a>
        <a class="block underline text-blue-300 p-2">Messages</a>
        <a class="block underline text-blue-300 p-2">Profile</a>
        <button class="mt-12 rounded-full bg-blue-500 text-white px-8 py-3 flex items-center justify-center">Tweet</button>
      </div>
      <div class="col-span-2">
        <div class="p-4 font-semibold">
          Home
        </div>

        <textarea class="w-full bg-gray-300 text-gray-700 mb-4 p-2" placeholder="What's up?"></textarea>
        <button class="rounded-full bg-blue-500 text-white px-4 py-2 flex items-center justify-center">Tweet</button>

        <div class="mt-16">
          <%= for {name, handle, date, body} <- tweets() do %>
            <div class="mb-16 last:mb-0">
              <div class="p-3 bg-gray-600">
                <strong class="font-semibold text-gray-50"><%= name %></strong>
                <span class="text-blue-400"><%= handle %></span>
                <span class="text-gray-400"><%= date %></span>
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
