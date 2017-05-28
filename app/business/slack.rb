# frozen_string_literal: true
require 'httpclient'

module Slack
  module Invitation
    extend self
    delegate :url_helpers, to: %{Rails.application.routes}

    def post!(invitator, invitation)
      channel = im!(invitator, invitation.user)

      response = HTTPClient.new.post("https://slack.com/api/chat.postMessage", {
        "token" => invitator.oauth_token,
        "channel" => channel,
        "pretext" => "#{invitator.name} te convidou para participar da equipe #{invitation.team.name}!\n" +
          "Veja aqui: #{url_helpers.invitation_url(invitation)}"
      }.tap { |h| Rails.logger.info(h.inspect)})

      payload = JSON.parse(response.body)

      if payload["ok"]
        :ok
      else
        raise "[SLACK] #{payload["error"]}"
      end
    end

    def im!(from, to)
      response = HTTPClient.new.post("https://slack.com/api/im.open", {
        "token" => from.oauth_token,
        "user" => to.user_id
      }.tap { |h| Rails.logger.info(h.inspect)})

      payload = JSON.parse(response.body)

      if payload["ok"]
        payload["channel"]["id"]
      else
        raise "[SLACK] #{payload["error"]}"
      end
    end
  end

  
end