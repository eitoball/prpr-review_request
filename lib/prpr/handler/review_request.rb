# frozen_string_literal: true

require 'prpr/action/review_request/requested'
require 'prpr/event/event'
require 'prpr/handler/base'

module Prpr
  module Handler
    class ReviewRequest < Base
      handle Event::PullRequest, action: /review_requested/ do
        Prpr::Action::ReviewRequest::Requested.new(event).call
      end
    end
  end
end
