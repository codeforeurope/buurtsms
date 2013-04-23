class OutMessage < ActiveRecord::Base
  STATUSES = %w"sent unsent"

  attr_accessible :direction, :error_text, :from, :in_messsage_id, :message_date, :message_id, :status, :text, :timestamp, :to, :type
end
