require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "criado_com_sucesso" do
    mail = UserMailer.criado_com_sucesso
    assert_equal "Criado com sucesso", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
