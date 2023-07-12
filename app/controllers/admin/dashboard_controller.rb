# frozen_string_literal: true

module Admin
  class DashboardController < BaseController
    include Redisable

    def index
      @system_checks         = Admin::SystemCheck.perform
      @time_period           = (29.days.ago.to_date...Time.now.utc.to_date)
      @pending_users_count   = User.pending.count
      @pending_reports_count = Report.unresolved.count
      @pending_tags_count    = Tag.pending_review.count
      @nodeinfo_show_blocks  = Setting.nodeinfo_show_blocks 
      @spam_check_enabled    = Setting.spam_check_enabled
    end

    private

    def redis_info
      @redis_info ||= begin
        if redis.is_a?(Redis::Namespace)
          redis.redis.info
        else
          redis.info
        end
      end
    end
  end
end
