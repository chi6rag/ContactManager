Fabricator(:user) do 
	name "Sample User 1"
	provider "twitter"
	uid {Fabricate.sequence(:uid)}
end