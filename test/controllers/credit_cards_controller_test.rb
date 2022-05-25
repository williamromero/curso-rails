require "test_helper"

class CreditCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get principal" do
    get credit_cards_principal_url
    assert_response :success
  end

  test "should get payment" do
    get credit_cards_payment_url
    assert_response :success
  end
end
