class SmsClient < ActiveRecord::Base
  attr_accessible :ChangeFee, :ClientID, :ClientName, :ClientPhoneNumber, :CreditAdjustment, :DebtForgive, :Deceased, :DeferredCredit, :Delivery, :DistrictID, :DistrictName, :Dropped, :DroppedDate, :Enrollment, :EnrollmentDate, :FMID, :FOID, :Facilitator, :FieldManager, :FieldOfficer, :FirstSeason, :FuneralAsstFee, :GovDistrictID, :GovDistrictName, :GroupActive, :GroupFirstSeason, :GroupID, :GroupName, :InputCredit, :LandWaterHarvest, :LastRepayment, :NationalID, :NewClientFee, :PreviousDeferredCredit, :RepaymentTotal, :SeasonClientID, :SeasonDataEntryDate, :SeasonID, :SeasonName, :SectorID, :SectorName, :Service, :SiteActive, :SiteFirstSeason, :SiteID, :SiteName, :StockID, :TotalCredit, :TrainingFee, :district, :site, :group, :gRepaymentAmount, :lRepaymentAmount, :gRepaymentRate, :lRepaymentRate
  attr_accessor :district, :site, :group, :gRepaymentAmount, :lRepaymentAmount, :gRepaymentRate, :lRepaymentRate
  self.primary_key = "ClientID"

  def self.by_district(district)
    if district.present?
      where(:DistrictID => district)
    else 
      where('1=1')
    end
  end
  
  def self.by_site(site)
    if site.present?
      where(:SiteID => site)
    else 
      where('1=1')
    end
  end
  
  def self.by_group(group)
    if group.present?
      where(:GroupID => group)
    else 
      where('1=1')
    end
  end
  
  def self.greaterthan_amount(amount)
    if amount.present?
      where("RepaymentTotal > ?", amount)
    else 
      where('1=1')
    end
  end
  
  def self.lessthan_amount(amount)
    if amount.present?
      where("RepaymentTotal < ?", amount)
    else 
      where('1=1')
    end
  end
  
  def self.greaterthan_rate(rate)
    if rate.present?
      where("RepaymentTotal/NullIF(TotalCredit,0) > ?", rate)
    else 
      where('1=1')
    end
  end
  
  def self.lessthan_rate(rate)
    if rate.present?
      where("RepaymentTotal/NullIF(TotalCredit,0) < ?", rate)
    else 
      where('1=1')
    end
  end
end
  