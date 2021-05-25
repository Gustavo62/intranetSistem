require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  test "cad_indeferido" do
    mail = AdminMailer.cad_indeferido
    assert_equal "Cad indeferido", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
