var I18n = I18n || {};
I18n.translations = {"en":{"active_admin":{"dashboard":"Dashboard","dashboard_welcome":{"welcome":"Welcome to Active Admin. This is the default dashboard page.","call_to_action":"To add dashboard sections, checkout 'app/admin/dashboard.rb'"},"view":"View","edit":"Edit","delete":"Delete","delete_confirmation":"Are you sure you want to delete this?","new_model":"New %{model}","create_model":"New %{model}","edit_model":"Edit %{model}","update_model":"Edit %{model}","delete_model":"Delete %{model}","details":"%{model} Details","cancel":"Cancel","empty":"Empty","previous":"Previous","next":"Next","download":"Download:","has_many_new":"Add New %{model}","has_many_delete":"Delete","filter":"Filter","clear_filters":"Clear Filters","search_field":"Search %{field}","equal_to":"Equal To","greater_than":"Greater Than","less_than":"Less Than","main_content":"Please implement %{model}#main_content to display content.","logout":"Logout","powered_by":"Powered by %{active_admin} %{version}","sidebars":{"filters":"Filters"},"pagination":{"empty":"No %{model} found","one":"Displaying <b>1</b> %{model}","one_page":"Displaying <b>all %{n}</b> %{model}","multiple":"Displaying %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b> of <b>%{total}</b> in total","entry":{"one":"entry","other":"entries"}},"any":"Any","blank_slate":{"content":"There are no %{resource_name} yet.","link":"Create one"},"batch_actions":{"button_label":"Batch Actions","delete_confirmation":"Are you sure you want to delete these %{plural_model}? You won't be able to undo this.","succesfully_destroyed":{"one":"Successfully destroyed 1 %{model}","other":"Successfully destroyed %{count} %{plural_model}"},"selection_toggle_explanation":"(Toggle Selection)","link":"Create one","action_label":"%{title} Selected","labels":{"destroy":"Delete"}},"comments":{"body":"Body","author":"Author","title":"Comment","add":"Add Comment","resource":"Resource","no_comments_yet":"No comments yet.","title_content":"Comments (%{count})","errors":{"empty_text":"Comment wasn't saved, text was empty."}},"devise":{"login":{"title":"Login","remember_me":"Remember me","submit":"Login"},"reset_password":{"title":"Forgot your password?","submit":"Reset My Password"},"change_password":{"title":"Change your password","submit":"Change my password"},"unlock":{"title":"Resend unlock instructions","submit":"Resend unlock instructions"},"links":{"sign_in":"Sign in","forgot_your_password":"Forgot your password?"}},"access_denied":{"message":"You are not authorized to perform this action."},"index_list":{"table":"Table","block":"List","grid":"Grid","blog":"Blog"}},"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match confirmation","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","too_long":"is too long (maximum is %{count} characters)","too_short":"is too short (minimum is %{count} characters)","wrong_length":"is the wrong length (should be %{count} characters)","not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","odd":"must be odd","even":"must be even","expired":"has expired, please request a new one","not_found":"not found","already_confirmed":"was already confirmed, please try signing in","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"},"carrierwave_processing_error":"failed to be processed","carrierwave_integrity_error":"is not of an allowed file type","carrierwave_download_error":"could not be downloaded","extension_white_list_error":"You are not allowed to upload %{extension} files, allowed types: %{allowed_types}","extension_black_list_error":"You are not allowed to upload %{extension} files, prohibited types: %{prohibited_types}","rmagick_processing_error":"Failed to manipulate with rmagick, maybe it is not an image? Original Error: %{e}","mime_types_processing_error":"Failed to process file with MIME::Types, maybe not valid content-type? Original Error: %{e}","mini_magick_processing_error":"Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: %{e}","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one"}},"activerecord":{"errors":{"messages":{"taken":"has already been taken","record_invalid":"Validation failed: %{errors}"}},"models":{"article":"news"}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":""}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}","article":{"create":"Submit News","update":"Save the News","submit":"Save the News"}},"button":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"},"page_entries_info":{"one_page":{"display_entries":{"zero":"No %{entry_name} found","one":"Displaying <b>1</b> %{entry_name}","other":"Displaying <b>all %{count}</b> %{entry_name}"}},"more_pages":{"display_entries":"Displaying %{entry_name} <b>%{first}&nbsp;-&nbsp;%{last}</b> of <b>%{total}</b> in total"}}},"meta_search":{"or":"or","predicates":{"equals":"%{attribute} equals","does_not_equal":"%{attribute} doesn't equal","contains":"%{attribute} contains","does_not_contain":"%{attribute} doesn't contain","starts_with":"%{attribute} starts with","does_not_start_with":"%{attribute} doesn't start with","ends_with":"%{attribute} ends with","does_not_end_with":"%{attribute} doesn't end with","greater_than":"%{attribute} greater than","less_than":"%{attribute} less than","greater_than_or_equal_to":"%{attribute} greater than or equal to","less_than_or_equal_to":"%{attribute} less than or equal to","in":"%{attribute} is one of","not_in":"%{attribute} isn't one of","is_true":"%{attribute} is true","is_false":"%{attribute} is false","is_present":"%{attribute} is present","is_blank":"%{attribute} is blank","is_null":"%{attribute} is null","is_not_null":"%{attribute} isn't null"}},"flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"update":{"notice":"%{resource_name} was successfully updated."},"destroy":{"notice":"%{resource_name} was successfully destroyed.","alert":"%{resource_name} could not be destroyed."}}},"devise":{"failure":{"already_authenticated":"You are already signed in.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your account before continuing.","locked":"Your account is locked.","invalid":"Invalid email or password.","invalid_token":"Invalid authentication token.","timeout":"Your session expired, please sign in again to continue.","inactive":"Your account was not activated yet.","not_found_in_database":"Invalid email or password."},"sessions":{"signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"passwords":{"send_instructions":"You will receive an email with instructions about how to reset your password in a few minutes.","updated":"Your password was changed successfully. You are now signed in.","updated_not_active":"Your password was changed successfully.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided."},"confirmations":{"send_instructions":"You will receive an email with instructions about how to confirm your account in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions about how to confirm your account in a few minutes.","confirmed":"Your account was successfully confirmed. You are now signed in."},"registrations":{"signed_up":"Welcome! You have signed up successfully.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please open the link to activate your account.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","updated":"You updated your account successfully.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and click on the confirm link to finalize confirming your new email address.","destroyed":"Bye! Your account was successfully cancelled. We hope to see you again soon."},"unlocks":{"send_instructions":"You will receive an email with instructions about how to unlock your account in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions about how to unlock it in a few minutes."},"omniauth_callbacks":{"success":"Successfully authenticated from %{kind} account.","failure":"Could not authenticate you from %{kind} because \"%{reason}\"."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock Instructions"}},"back":"Back","forgot_pass":{"title":"Forgot your password?","submit":"Send me reset password instructions"},"change_pass":{"title":"Change your password","new_pass":"New password","confirm_pass":"Confirm your new password","submit":"Change my password"},"edit":{"title":"Edit","pass_hint":"leave it blank if you don't want to change it","current_pass_hint":"we need your current password to confirm your changes","submit":"Update","cancel_acc":"Cancel my account","unhappy":"Unhappy?","destroy_confirm":"Are you sure?"}},"article":{"news":"News","title":"Title","back":"Back","show":{"action":"Show"},"create":{"action":"Create news","notice":"The news was successfully created."},"update":{"action":"Edit","title":"Editing news","notice":"The news was successfully updated."},"destroy":{"action":"Destroy","notice":"The news was successfully destroyed.","alert":"The news can not be destroyed."}},"developers":{"v1":{"title":"Server API documentation version 1","request_params":"Parameters:","samples":"Samples","topics":{"title":"Topics","basic":{"title":"Basic"},"architecture":{"title":"API architecture"},"semesters":{"title":"Semesters"},"groups":{"title":"Groups"},"students":{"title":"Students"},"subjects":{"title":"Subjects"}}}},"formtastic":{"yes":"Yes","no":"No","create":"Create %{model}","update":"Update %{model}","submit":"Submit %{model}","cancel":"Cancel %{model}","reset":"Reset %{model}","required":"required"},"simple_form":{"yes":"Yes","no":"No","required":{"text":"required","mark":"*"},"error_notification":{"default_message":"Please review the problems below:"},"labels":{"defaults":{"password":"Password","password_confirmation":"Password confirmation","email":"E-mail"},"user":{"new":{"email":"E-mail"},"edit":{"email":"E-mail"}}}},"wellcome":"Hello","app":{"logo":"Gradebook","study_title":"Learning process","my_subjects_title":"My subjects","copyright":"All rights reserved. KNTU 2013","author":"Ishchenko A.O KI(PM)-12M","description":"Software development dynamics analysis of student achievement in the educational process"},"languages":{"select":"Select language","uk":"Українська","ru":"Русский","en":"English"},"login":"Login","sign_up":"Sign up","logout":"Logout","edit_account":"Edit account","remember_me":"Remember me","didnt_recive_confirm":"Didn't receive confirmation instructions?","didnt_recive_unlock":"Didn't receive unlock instructions?","views":{"pagination":{"first":"&laquo; First","last":"Last &raquo;","previous":"&lsaquo; Prev","next":"Next &rsaquo;","truncate":"&hellip;"}},"ckeditor":{"page_title":"CKEditor Files Manager","confirm_delete":"Delete file?","buttons":{"cancel":"Cancel","upload":"Upload","delete":"Delete"}}}};