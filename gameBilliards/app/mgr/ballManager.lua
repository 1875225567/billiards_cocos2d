ballMgr = ballMgr or {}

local ballState = {}  --ʵʱ״̬��������������������һ�˵�
local ballProcess = {}  --��������

function ballMgr:insertBallState(value)
    table.insert(ballState,value)
end

function ballMgr:setBallState(event)
    ballState = event
end

function ballMgr:getBallState()
    return ballState
end

function ballMgr:setBallProcess(event)
    ballProcess = event
end

function ballMgr:getBallProcess()
    return ballProcess
end

return ballMgr