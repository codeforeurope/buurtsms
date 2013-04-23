class InMessage < ActiveRecord::Base
  attr_accessible :concat, :concat_part, :concat_ref, :concat_total, :message_id, :message_timestamp, :msisdn, :network_code, :status, :text, :to, :type
end
