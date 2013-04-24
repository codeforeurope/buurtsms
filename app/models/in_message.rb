class InMessage < ActiveRecord::Base
  STATUSES = %w"received replied"

  attr_accessible :concat, :concat_part, :concat_ref, :concat_total, :message_id, :message_timestamp, :msisdn, :network_code, :status, :text, :to, :message_type, :posted_to_fb
end
