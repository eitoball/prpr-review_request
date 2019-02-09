# frozen_string_literal: true

require 'test_helper'
# require 'prpr/publisher/adapter/base'
require 'prpr/publisher/adapter/console'
require 'hashie/mash'

module Prpr
  module Action
    module ReviewRequest
      class TestRequested < Test::Unit::TestCase
        def setup
          stub.proxy(ENV).fetch('REVIEW_REQUEST_BODY_TEMPLATE', anything) { |_| '%<reviewer>s, rewiew %<pr_url>s!' }
          stub.proxy(ENV).[]('REVIEW_REQUEST_ROOM') { |_| '#general' }
          stub.proxy(ENV).[]
        end

        def test_requeted
          event = Hashie::Mash.new(
            action: 'review_requested',
            pull_request: {
              html_url: 'https://github.com/Codertocat/Hello-World/pull/1'
            },
            requested_reviewers: [
              {
                login: 'Codertocat',
                avator_url: 'https://avatars1.githubusercontent.com/u/00000000?v=1'
              }
            ],
            sender: { login: 'Codertocat' }
          )
          output = capture_output do
            Prpr::Action::ReviewRequest::Requested.new(event).call
          end
          assert_equal('[#general] <Codertocat> Codertocat, rewiew https://github.com/Codertocat/Hello-World/pull/1!', output.first.chomp)
        end
      end
    end
  end
end
