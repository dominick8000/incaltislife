_action = _this select 3;

if (_action == "patchself") then
{
  [] spawn CUP_doPatchSelf;
};

if (_action == "injectself") then
{
  [] spawn CUP_doInjectSelf;
};

if (_action == "bandageself") then
{
  [] spawn CUP_doBandageSelf;
};

if (_action == "patchtarget") then
{
  cursorTarget spawn CUP_doPatchTarget;
};

if (_action == "injecttarget") then
{
  cursorTarget spawn CUP_doInjectTarget;
};

if (_action == "bandagetarget") then
{
  cursorTarget spawn CUP_doBandageTarget;
};

if (_action == "drag") then
{
  cursorTarget spawn CUP_doDrag;
};

if (_action == "checkownvitals") then
{
  [] spawn CUP_doCheckOwnVitals;
};

if (_action == "checktargetvitals") then
{
  cursorTarget spawn CUP_doCheckTargetVitals;
};