# frozen_string_literal: true

require 'prpr/action/base'
require 'prpr/publisher/adapter/base'
require 'prpr/publisher/message'

module Prpr
  module Action
    module ReviewRequest
      class Requested < Base
        def call
          if event.requested_reviewer
            body_template = ENV.fetch('REVIEW_REQUEST_BODY_TEMPLATE', '%<reviewer>s is requested to review %<pr_url>s')
            from = event.sender
            room = ENV['REVIEW_REQUEST_ROOM']
            body = format(body_template, reviewer: event.requested_reviewer.login, pr_url: event.pull_request.html_url)
            message = Prpr::Publisher::Message.new(body: body, from: from, room: room)
            Prpr::Publisher::Adapter::Base.broadcast(message)
          end
        end
      end
    end
  end
end
