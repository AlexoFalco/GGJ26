with other		//se sposti in obj_player, cancella
{
	if other.is_touchable
	{
		tempo_detrasformazione = noone;
		transformation = 0;
		switch other.id_mask
		{
			case masks.drago: tempo_trasformazione = 180; break;
			case masks.cacca: tempo_trasformazione = 90; break;
			case masks.orco: tempo_trasformazione = 270; break;
			case masks.paladino: case masks.megaman: tempo_trasformazione = 120; break;
			default: tempo_trasformazione = 10;
		}
		transformation = other.id_mask;
		tempo_detrasformazione = time_source_create
		(
			time_source_game,tempo_trasformazione,time_source_units_frames,
			function(){
				transformation = 0;
			}
		)
		time_source_start(tempo_detrasformazione);
		instance_destroy(other);
	}
}