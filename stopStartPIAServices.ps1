(get-service *-pia | select -expand name) | foreach-object {stop-service $_}
(get-service *-pia | select -expand name) | foreach-object {start-service $_}