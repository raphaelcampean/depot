class User < ApplicationRecord
  after_destroy :ensure_an_admin_remains

  has_secure_password

  # validates_uniqueness_of :name
  #

  class Error < StandardError
  end

  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
