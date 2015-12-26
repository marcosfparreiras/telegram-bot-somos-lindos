require 'telegram/bot'
require_relative 'respostas'

puts 'Starting Bot...'
token = '146315178:AAHfc9sFBmjv50zl4EO6D3LnqFbFaG1Fla4'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/fotinha'
      bot.api.sendPhoto(chat_id: message.chat.id, photo: File.new(Dir['img/*'].sample))
    when '/cartinha'
      bot.api.sendMessage(chat_id: message.chat.id, text: "#{Respostas.cartinha}")
    when '/declaracaozinha'
      bot.api.sendMessage(chat_id: message.chat.id, text: "#{Respostas.declaracaozinha}")
    end
  end
end
