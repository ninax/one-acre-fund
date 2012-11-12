class SmsClient < ActiveRecord::Base
  attr_accessible :ChangeFee, :ClientID, :ClientName, :ClientPhoneNumber, :CreditAdjustment, :DebtForgive, :Deceased, :DeferredCredit, :Delivery, :DistrictID, :DistrictName, :Dropped, :DroppedDate, :Enrollment, :EnrollmentDate, :FMID, :FOID, :Facilitator, :FieldManager, :FieldOfficer, :FirstSeason, :FuneralAsstFee, :GovDistrictID, :GovDistrictName, :GroupActive, :GroupFirstSeason, :GroupID, :GroupName, :InputCredit, :LandWaterHarvest, :LastRepayment, :NationalID, :NewClientFee, :PreviousDeferredCredit, :RepaymentTotal, :SeasonClientID, :SeasonDataEntryDate, :SeasonID, :SeasonName, :SectorID, :SectorName, :Service, :SiteActive, :SiteFirstSeason, :SiteID, :SiteName, :StockID, :TotalCredit, :TrainingFee
  self.primary_key = "ClientID"
end
