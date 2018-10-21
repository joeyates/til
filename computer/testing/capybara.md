# Capybara

* Docs: http://www.rubydoc.info/github/jnicklas/capybara/master/frames/index

## Capybara::DSL

* `all`
* `body`
* `click_*`
* `current_*`
* `find`
* `find_*`
* `first`
* `has_*`
* `html`
* `page` - the Capybara::Session instance
* `query`
* `save_page`
* `save_screenshot` - page.save_screenshot({path})
* `select`
* `text`

  accept_alert          current_path     has_checked_field?       has_selector?             source          
  accept_confirm        current_scope    has_content?             has_table?                status_code     
  accept_prompt         current_url      has_css?                 has_text?                 switch_to_window
  all                   current_window   has_field?               has_title?                text            
  assert_no_selector    dismiss_confirm  has_link?                has_unchecked_field?      title           
  assert_no_text        dismiss_prompt   has_no_button?           has_xpath?                uncheck         
  assert_no_title       evaluate_script  has_no_checked_field?    html                      unselect        
  assert_selector       execute_script   has_no_content?          open_new_window           using_session   
  assert_text           field_labeled    has_no_css?              page                      using_wait_time 
  assert_title          fill_in          has_no_field?            query                     window_opened_by
  attach_file           find             has_no_link?             refute_selector           windows         
  body                  find_button      has_no_select?           reset_session!            within          
  check                 find_by_id       has_no_selector?         resolve                   within_fieldset 
  choose                find_field       has_no_table?            response_headers          within_frame    
  click_button          find_link        has_no_text?             save_and_open_page        within_table    
  click_link            first            has_no_title?            save_and_open_screenshot  within_window   
  click_link_or_button  go_back          has_no_unchecked_field?  save_page               
  click_on              go_forward       has_no_xpath?            save_screenshot         
  current_host          has_button?      has_select?              select                  

## Capybara::Session

* execute_script

# SitePrism

## SitePrism::Page

* `displayed?(seconds = )`
* `set` - set text
* `text` - retrieve the text
* `wait_for_`[ELEMENT]

# Prismatic (plug, plug)

# [capybara-webkit][capybara-webkit]

Driver-specific methods:

* `console_messages`
* `error_messages`
* `cookies`

[capybara-webkit]: https://github.com/thoughtbot/capybara-webkit
