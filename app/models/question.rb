class Question < ApplicationRecord
  # This is the Question model. We
  # generated this file with the command
  # rails generate model question title:string  body:text

  # Rails will add attr_accessors for all columns of the table (i.e. id, title, body, created_at, updated_at)

  #  Create validations by using the 'validates'
  # method. The arguments are (in order):
  # - A column names a symbol,
  # - Named arguments corresponding to validation rules

  # To read more on validations https://guides.rubyonrails.org/active_record_validations.html

  validates(:title, presence: true, uniqueness: true)

  validates(:body, presence: { message: "must exist" },
                   length: { minimum: 10 })

  validates(:view_count, numericality: { greater_than_or_equal_to: 0 })

  # Custom validations - method name is singular
  validate(:no_monkey)

  # def self.recent
  #   order(created_at: :desc).limit(10)
  # end
  # ^ scopes like the above are such a commonly used
  # feature in Rails, there's a way to create them
  # quicker. It takes a name, and a lambda as a callback

  scope(:recent, -> { order(created_at: :desc).limit(10) })

  # def self.search(query)
  #   where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%")
  # end

  scope(:search, -> (query) { where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") })

  # before_validation is lifecycle callback method
  # that allows us to respond to events in an objects
  # lifecycle. (i.e. being validated, saved, updated etc.). These methods take a symbol named after a method and calls that method at the appropriate time
  before_validation(:set_default_view_count)

  private

  def no_monkey
    # &. is the safe navigation operator. It is used
    # like the . operator to call methods on an object
    # If the method doesn't exist for the object, nil
    # will be returned rather than throwing an error.
    if body&.downcase&.include?("monkey")
      # To make a record invalid, you must add
      # a validation error using errors.add method.
      # Arguments:
      # Symbol for the invalid column
      # An error message as a string
      self.errors.add(:body, "must not have monkeys")
    end
  end

  def set_default_view_count
    # If you are writing to an attribute accessor,
    # you must prefix with self, which you don't have
    # to do if you are just reading it.
    self.view_count ||= 0
    # self.view_count || self.view_count = 0
  end
end
