class User < ApplicationRecord

  attr_writer :first_name, :last_name
  before_save :full_name

  def split_name
    name ? name.split(' ') : ['','']
  end

  def first_name
    split_name[0]
  end

  def last_name
    split_name[1..split_name.length].join(' ')
  end

  def full_name
    self.name = "#{@first_name} #{@last_name}"
  end
end
