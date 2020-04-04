require 'test_helper'

class Admin::Discogs::ReleaseFormTest < ActiveSupport::TestCase
  test '#save' do
    discogs_release_stub(5835903)

    form = Admin::Discogs::ReleaseForm.new(Release.new, valid_params)
    assert form.save
  end

  test 'not home street home release' do
    discogs_release_stub(11223344)

    form = Admin::Discogs::ReleaseForm.new(Release.new, discogs_release_id: 11223344)
    assert_not form.valid?

    assert_includes form.errors.full_messages_for(:discogs_release_id),
                    'Discogs release is not from Home Street Home Records'
  end

  private

  def valid_params
    {
      discogs_release_id: 5835903
    }
  end
end
