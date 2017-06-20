json.messages @group.messages do |message|
  json.user_name message.user.name
  json.text message.text
  json.avatar message.avatar
  json.created_at message.created_at
end
