# frozen_string_literal: true
require 'httpclient'

module Slack
  module Invitation
    extend self
    delegate :url_helpers, to: %{Rails.application.routes}

    def post!(invitator, invitation)
      channel = im!(invitator, invitation.user)

      response = HTTPClient.new.post("https://slack.com/api/chat.postMessage", log({
        "token" => invitator.oauth_token,
        "channel" => channel,
        "icon_emoji" => ":checkered_flag:",
        "text" => "#{invitator.name} te convidou para participar da equipe #{invitation.team.name}!\n" +
          "Veja aqui: #{url_helpers.invitation_url(invitation)}"
      }))

      payload = JSON.parse(response.body)

      if payload["ok"]
        :ok
      else
        raise "[SLACK] #{payload["error"]}"
      end
    end

    def im!(from, to)
      response = HTTPClient.new.post("https://slack.com/api/im.open", log({
        "token" => from.oauth_token,
        "user" => to.user_id
      }))

      payload = JSON.parse(response.body)

      if payload["ok"]
        payload["channel"]["id"]
      else
        raise "[SLACK] #{payload["error"]}"
      end
    end

    def log(obj)
      Rails.logger.info("[SLACK] Payload: #{obj.inspect}")
      obj
    end
  end

  
end