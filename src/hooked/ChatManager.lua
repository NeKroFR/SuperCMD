local send = ChatManager.send_message

function ChatManager:send_message(channel_id, sender, message)
  sender = managers.network:session():local_peer()
  local CM = _G["CommandManager"]
  if CM then
	-- Valid prefix -> run command
	if CM:validPrefix(message:sub(1, 1)) and sender then
      CM:process_input(message, sender)
      return
    end
  end
  -- Else send message
  send(self, channel_id, sender, message)
end


