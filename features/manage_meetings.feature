Feature: Meetings
  In order to know what's happening in the community
  As a citizen
  I want to see a list of the most current meetings

  Scenario: See a single meeting
    Given the following meetings:
      |meeting_date|url|
      |2010-07-15|http://s3.amazon.com/meeting.webm|
    When I go to "the homepage"
    Then I should see "2010-07-15"
