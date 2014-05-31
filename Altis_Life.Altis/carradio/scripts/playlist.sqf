
disableSerialization;
closeDialog 0;
CLAY_RadioPlaylistEditor = createDialog "CLAY_CarRadio_PlaylistDlg";


_allTracks = CLAY_RadioElectro + CLAY_RadioMetal + CLAY_RadioPop;

for "_i" from 0 to ((count _allTracks) - 1) do
{
	_act = _allTracks select _i;
	_track = _act select 0;
	_title = _act select 1;
	_t = _act select 2;

	_index = lbAdd [633, _title];
	lbSetData [633, _index, _track];
	lbSetValue [633, _index, _t];
};
