class ToolsUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool

  validates :user_id, presence: true
  validates :tool_id, presence: true
  validates :checkout, presence: true
end
