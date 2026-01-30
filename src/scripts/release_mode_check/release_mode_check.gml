/// @function				release_mode_check(configEnums);
/// @param {list}	configs	lista di configurazioni da controllare
/// @description		    verifica che la modalità di rilascio corrisponde almeno ad una delle voci passate nella funzione
function release_mode_check()
{
	var result =  false;
	for (var i = 0; i < argument_count; i ++)
    {
        if RELEASE_MODE == argument[i] 
		{
			result = true
			break;
		}
    }
	
	return result;
}