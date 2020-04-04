class ApplicationForm
  include ActiveModel::Model

  delegate :persisted?, :to_param, to: :object

  attr_reader :object, :params

  def model_name
    ActiveModel::Name.new(self, nil, get_model_name)
  end

  private

  def get_model_name
    self.class.to_s.gsub(/Form$/, '')
  end
end
