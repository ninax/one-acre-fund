require 'test_helper'

class SmsClientsControllerTest < ActionController::TestCase
  setup do
    @sms_client = sms_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sms_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sms_client" do
    assert_difference('SmsClient.count') do
      post :create, sms_client: { ChangeFee: @sms_client.ChangeFee, ClientID: @sms_client.ClientID, ClientName: @sms_client.ClientName, ClientPhoneNumber: @sms_client.ClientPhoneNumber, CreditAdjustment: @sms_client.CreditAdjustment, DebtForgive: @sms_client.DebtForgive, Deceased: @sms_client.Deceased, DeferredCredit: @sms_client.DeferredCredit, Delivery: @sms_client.Delivery, DistrictID: @sms_client.DistrictID, DistrictName: @sms_client.DistrictName, Dropped: @sms_client.Dropped, DroppedDate: @sms_client.DroppedDate, Enrollment: @sms_client.Enrollment, EnrollmentDate: @sms_client.EnrollmentDate, FMID: @sms_client.FMID, FOID: @sms_client.FOID, Facilitator: @sms_client.Facilitator, FieldManager: @sms_client.FieldManager, FieldOfficer: @sms_client.FieldOfficer, FirstSeason: @sms_client.FirstSeason, FuneralAsstFee: @sms_client.FuneralAsstFee, GovDistrictID: @sms_client.GovDistrictID, GovDistrictName: @sms_client.GovDistrictName, GroupActive: @sms_client.GroupActive, GroupFirstSeason: @sms_client.GroupFirstSeason, GroupID: @sms_client.GroupID, GroupName: @sms_client.GroupName, InputCredit: @sms_client.InputCredit, LandWaterHarvest: @sms_client.LandWaterHarvest, LastRepayment: @sms_client.LastRepayment, NationalID: @sms_client.NationalID, NewClientFee: @sms_client.NewClientFee, PreviousDeferredCredit: @sms_client.PreviousDeferredCredit, RepaymentTotal: @sms_client.RepaymentTotal, SeasonClientID: @sms_client.SeasonClientID, SeasonDataEntryDate: @sms_client.SeasonDataEntryDate, SeasonID: @sms_client.SeasonID, SeasonName: @sms_client.SeasonName, SectorID: @sms_client.SectorID, SectorName: @sms_client.SectorName, Service: @sms_client.Service, SiteActive: @sms_client.SiteActive, SiteFirstSeason: @sms_client.SiteFirstSeason, SiteID: @sms_client.SiteID, SiteName: @sms_client.SiteName, StockID: @sms_client.StockID, TotalCredit: @sms_client.TotalCredit, TrainingFee: @sms_client.TrainingFee }
    end

    assert_redirected_to sms_client_path(assigns(:sms_client))
  end

  test "should show sms_client" do
    get :show, id: @sms_client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sms_client
    assert_response :success
  end

  test "should update sms_client" do
    put :update, id: @sms_client, sms_client: { ChangeFee: @sms_client.ChangeFee, ClientID: @sms_client.ClientID, ClientName: @sms_client.ClientName, ClientPhoneNumber: @sms_client.ClientPhoneNumber, CreditAdjustment: @sms_client.CreditAdjustment, DebtForgive: @sms_client.DebtForgive, Deceased: @sms_client.Deceased, DeferredCredit: @sms_client.DeferredCredit, Delivery: @sms_client.Delivery, DistrictID: @sms_client.DistrictID, DistrictName: @sms_client.DistrictName, Dropped: @sms_client.Dropped, DroppedDate: @sms_client.DroppedDate, Enrollment: @sms_client.Enrollment, EnrollmentDate: @sms_client.EnrollmentDate, FMID: @sms_client.FMID, FOID: @sms_client.FOID, Facilitator: @sms_client.Facilitator, FieldManager: @sms_client.FieldManager, FieldOfficer: @sms_client.FieldOfficer, FirstSeason: @sms_client.FirstSeason, FuneralAsstFee: @sms_client.FuneralAsstFee, GovDistrictID: @sms_client.GovDistrictID, GovDistrictName: @sms_client.GovDistrictName, GroupActive: @sms_client.GroupActive, GroupFirstSeason: @sms_client.GroupFirstSeason, GroupID: @sms_client.GroupID, GroupName: @sms_client.GroupName, InputCredit: @sms_client.InputCredit, LandWaterHarvest: @sms_client.LandWaterHarvest, LastRepayment: @sms_client.LastRepayment, NationalID: @sms_client.NationalID, NewClientFee: @sms_client.NewClientFee, PreviousDeferredCredit: @sms_client.PreviousDeferredCredit, RepaymentTotal: @sms_client.RepaymentTotal, SeasonClientID: @sms_client.SeasonClientID, SeasonDataEntryDate: @sms_client.SeasonDataEntryDate, SeasonID: @sms_client.SeasonID, SeasonName: @sms_client.SeasonName, SectorID: @sms_client.SectorID, SectorName: @sms_client.SectorName, Service: @sms_client.Service, SiteActive: @sms_client.SiteActive, SiteFirstSeason: @sms_client.SiteFirstSeason, SiteID: @sms_client.SiteID, SiteName: @sms_client.SiteName, StockID: @sms_client.StockID, TotalCredit: @sms_client.TotalCredit, TrainingFee: @sms_client.TrainingFee }
    assert_redirected_to sms_client_path(assigns(:sms_client))
  end

  test "should destroy sms_client" do
    assert_difference('SmsClient.count', -1) do
      delete :destroy, id: @sms_client
    end

    assert_redirected_to sms_clients_path
  end
end
