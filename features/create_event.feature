Feature: create an event
  As member,
  So I can publish an event,
  I want to create a new event to the system

Background: user and event_type have been added to database
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "john", "123456"
  And I am on "the new event page"

  And the following event_type exists:
  | name      |
  | Palestra  |


Scenario: create an event
  When I fill in the following:
  | event_title         | Nova Reunião  |
  | event_summary       | Asd Reunião   |
  | event_place         | Aqui          |
  | event_address       | Av. Here 76   |
  | event_speaker       | Eu            |
  | event_responsible   | Vc            |
  | event_performance   | Alguém        |
  | event_url           | www.site.com  |
  
  And I press "Submeter"
  Then the event_type "Palestra" exists
  And I should see "Evento criado com sucesso"
  And I should see "Nova Reunião"
  And I should see "Asd Reunião"
  And I should see "Aqui"
  And I should see "Av. Here 76"
  And I should see "Eu"
  And I should see "Vc"
  And I should see "Alguém"
  And I should see "www.site.com"
  And I should see "Palestra"
  And I should see "04/04/2016"
  And I should see "14:30"
  And the event "Nova Reunião" exists