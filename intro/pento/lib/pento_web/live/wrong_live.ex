defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       score: 0,
       message: "Make a guess:",
       target_num: Enum.random(1..10),
       time: time()
     )}
  end

  def render(assigns) do
    ~H"""
    <h1><%= @target_num %></h1>
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
      It's <%= @time %>
    </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={n} ><%= n %></a>
      <% end %>
    </h2>
    """
  end

  def time() do
    DateTime.utc_now() |> to_string
  end

  def handle_event("guess", %{"number" => guess} = data, socket) do
    message = "Your guess: #{guess}. Wrong. Guess again}"
    target_num = socket.assigns.target_num

    {target_num, score} = get_score(socket, String.to_integer(guess))

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: score,
        target_num: target_num,
        time: time()
      )
    }
  end

  defp get_score(socket, guess) do
    target_num = socket.assigns.target_num

    case target_num == guess do
      true ->
        {Enum.random(1..10), socket.assigns.score + 10}

      false ->
        {socket.assigns.target_num, socket.assigns.score - 1}
    end
  end
end
