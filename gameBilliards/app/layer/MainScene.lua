--local MainScene = class("MainScene", cc.load("mvc").ViewBase)

--function MainScene:onCreate()
--    amgr.playMusic("bg_menu.mp3", true)
--    local layer = require(g_myGameName .. "/app/layer/gameBilliardsMainLayer").new()
--    if layer then
--        self:addChild(layer)
--    end
--end

--function MainScene:physicalMethod(m,a,v0,t,m1,m2,v1,v2,Vx,Ux)
--   --ţ�ٵڶ�����:
--   --f = m * a
--   local f = m * a 
--   --�ٶ�����ٶȹ�ϵ��ʽ:
--   local vt = v0 + a * t
--   --����Ħ�������˶�����ķ����෴, �谭�������ǰ�˶�.
--   --�����غ�

--   local m1 * v1 + m2 * v2 = m1 * v1' + m2 * v2'

--   --��ȫ������ײ 
--   --����û����ʧ, ���������¹�ʽ

--   1/2 * m1 * v1^2 + 1/2 * m2 * v2^2 = 1/2 * m1 * v1'^2 + 1/2 * m2 * v2'^2

--   --ǰ������Ķ��ܱ��־���, û������������ת��.

--   v1' = [(m1-m2) * v1 + 2 * m2 * v2] / (m1 + m2)
--�� v2' = [(m2-m1) * v2 + 2 * m1 * v1] / (m1 + m2)

--    --��ȫ�ǵ�����ײ
--    --���������������ת��, ���ܲ��غ�. �Ҵ�ʱ������ճ��, �ٶ�һ��, ��v1'=v2', ��ʱ������ʧ���
--    --�����������ײ
--    (x1 - x2) ^ 2 + (y1 - y2) ^ 2 <= (2*r) ^ 2

--    --���������̨�߿���ײ
--   -- x�������㶯���غ�

--����m1 * Vx + m2 * Ux = m1 * Vx' + m2 * Ux'

--    --���ٶ�������ײ����ȫ������ײ, �����������m1=m2, ���ݻ�������֪ʶƪ�Ľ���

--����Vx' = [(m1-m2) * Vx + 2 * m2 * Ux] / (m1 + m2) = Ux
--����Ux' = [(m2-m1) * Ux + 2 * m1 * Vx] / (m1 + m2) = Vx

--����--��X�᷽��, ���򽻻��ٶ�, ����Y�᷽��, ������ٶȲ���.
--����Vy' = Vy
--����Uy' = Uy
--    --������ײ����ٶȹ�ʽΪ:

--����V' = Vx' + Vy' = Ux + Vy
--����U' = Ux' + Uy' = Vx + Uy

--    --����߿����ײ��Ӧ 
--    --�ٶ���ײ��ײƽ��Ϊx��

--����Vx' = Vx
--����Vy' = -Vy

--����--�����ٶȹ�ʽΪ

--����V' = Vx' + Vy' = Vx - Vy

--    --���ʱ����(time_interval), ����Ϸ��FPS��ȷ��. ��24֡Ϊ��, ÿ40����ˢ��һ��.
--����--����̨�������, ���Ը�time_intervalΪ��������, ʹ���˶�����������:

--����Vt = V0 + a * t

--����--���о���Ϊ

--����S = V0 * t + 1/2 * a * t^2.

--����--Ȼ������������Ƿ�������ײ, Ȼ�������ײ��Ӧ����. ����û������.
--end

--function update(time_interval)

--    while time_interval > 0:
--        -- ��ײ���
--        if detectionCollide(time_interval, least_time, ball_pairs):
--            --/ ��Ϸ����least_time
--            billiards.update(least_time)
--            -- ����ײ�����������ײ��Ӧ
--            collideReaction(ball_pairs=>(ball, other))
--            --// time_interval ���� least_time
--            time_interval -= least_time
--        else��
--            --// ��Ϸ����least_time
--            billiards.update(time_interval)
--            time_interval = 0
--end

----��ײ����㷨
--function detectionCollide(time_interval, least_time, ball_pairs)
--    res = false;
--    least_time = time_interval;

--    foreach ball in billiards:
--        foreach otherBall in billiards:
--            --// �������ľ���
--            S = distance(ball, otherBall)
--            --// ��ĳһ����Ϊ�ο�����ϵ, ����һ���ٶ�������Ϊ U��=U-V
--            --// ��Բ�ĵ�ֱ����Ϊx��
--            Ux(relative) = Ux(other ball) - Vx(ball)
--            --//  ���÷���ʹ������Զ��, ��ֱ�Ӻ���
--            if Ux(relative) < 0��
--                continue
--            --//  ĳ�÷���ʹ������ӽ�, ���������ײ��Ԥ��ʱ���
--            A' = 2 * A; // ���ٶ�Ϊԭ��������

--            --// ȡ������С��ʱ���
--            delta_time = min(time_interval, Ux(relative) / Ax��)
--            --// Ԥ�ھ��� С�� ������룬����time_interval�в��ᷢ����ײ
--            if 1/2 * Ax�� * delta_time ^ 2 + Ux(relative) * delta_time < S - 2*r:
--                continue

--            --/--/ ��һԪ���η���, ʹ�ö��������ƽ����
--            res_time <= slove(1/2 * Ax�� * x ^ 2 + Ux(relative) * x = S - 2 * r)

--            if res_time < least_time:
--                ball_pairs <= (ball, otherBall)
--                least_time = res_time
--                res = true

--        foreach wall in billiards:
--            S = distance(ball, wall)
--            --// �费ֱ��ƽ��ķ���Ϊx��
--            if Vx < 0:
--                continue

--            --// ȡ������С��ʱ���
--            delta_time = min(time_interval, Vx / Ax)
--            --// Ԥ�ھ��� С�� ������룬����time_interval�в��ᷢ����ײ
--            if 1/2 * Ax * delta_time ^ 2 + Vx * delta_time < S - r:
--                continue

--            --// ��һԪ���η���, ʹ�ö��������ƽ���� 
--            res_time <= slove(1/2 * A * x ^ 2 + Vx * x = S - r)

--            if res_time < least_time:
--                ball_pairs <= (ball, walll)
--                least_time = res_time
--                res = true

--    return res
-- end

-- function Initialize(const b2SimplexCache* cache,  
--        const b2DistanceProxy* proxyA, const b2Sweep& sweepA,  
--        const b2DistanceProxy* proxyB, const b2Sweep& sweepB,  
--        float32 t1)  
--    {  
--        --//��ֵ����  
--        m_proxyA = proxyA;  
--        m_proxyB = proxyB;  
--        --// ��ȡ�����еĶ�����������֤  
--        int32 count = cache->count;  
--        b2Assert(0 < count && count < 3);  
--        --//��ֵɨƵ  
--        m_sweepA = sweepA;  
--        m_sweepB = sweepB;  
--        --//��ȡ�任  
--        b2Transform xfA, xfB;  
--        m_sweepA.GetTransform(&xfA, t1);  
--        m_sweepB.GetTransform(&xfB, t1);  
--        --//һ������  
--        if (count == 1)  
--        {  
--            --//��ֵ�����A��B�ľֲ�����  
--            m_type = e_points;  
--            b2Vec2 localPointA = m_proxyA->GetVertex(cache->indexA[0]);  
--            b2Vec2 localPointB = m_proxyB->GetVertex(cache->indexB[0]);  
--            --//��ȡ�任���A��B��  
--            b2Vec2 pointA = b2Mul(xfA, localPointA);  
--            b2Vec2 pointB = b2Mul(xfB, localPointB);  
--            --//��ȡ��B����A�������������䳤�ȣ�����׼��  
--            m_axis = pointB - pointA;  
--            float32 s = m_axis.Normalize();  
--            return s;  
--        }  
--        else if (cache->indexA[0] == cache->indexA[1])  
--        {  
--            --// ��������B�Ϻ�һ����A��  
--            --//��ֵ����ȡB�ϵ������ֲ�����  
--            m_type = e_faceB;  
--            b2Vec2 localPointB1 = proxyB->GetVertex(cache->indexB[0]);  
--            b2Vec2 localPointB2 = proxyB->GetVertex(cache->indexB[1]);  
--            --//��ȡB2��B1�γ������Ĵ�ֱ����������׼��  
--            m_axis = b2Cross(localPointB2 - localPointB1, 1.0f);  
--            m_axis.Normalize();  
--            --//��ȡ������  
--            b2Vec2 normal = b2Mul(xfB.q, m_axis);  
--            --// ��ȡB1��B2���м��  
--            m_localPoint = 0.5f * (localPointB1 + localPointB2);  
--            b2Vec2 pointB = b2Mul(xfB, m_localPoint);  
--            --// ��ȡ�ֲ���A������õ�A  
--            b2Vec2 localPointA = proxyA->GetVertex(cache->indexA[0]);  
--            b2Vec2 pointA = b2Mul(xfA, localPointA);  
--            --// ��ȡ����  
--            float32 s = b2Dot(pointA - pointB, normal);  
--            --// ����Ϊ�����÷�  
--            if (s < 0.0f)  
--            {  
--                m_axis = -m_axis;  
--                s = -s;  
--            }  
--            return s;  
--        }  
--        else  
--        {  
--            --// ��������A�Ϻ�һ��������������B��  
--            m_type = e_faceA;  
--            b2Vec2 localPointA1 = m_proxyA->GetVertex(cache->indexA[0]);  
--            b2Vec2 localPointA2 = m_proxyA->GetVertex(cache->indexA[1]);  
--            --//��ȡA2��A1�γ������Ĵ�ֱ����������׼��  
--            m_axis = b2Cross(localPointA2 - localPointA1, 1.0f);  
--            m_axis.Normalize();  
--            --//��ȡ������  
--            b2Vec2 normal = b2Mul(xfA.q, m_axis);  
--            --//��ȡA1��A2���м��  
--            m_localPoint = 0.5f * (localPointA1 + localPointA2);  
--            b2Vec2 pointA = b2Mul(xfA, m_localPoint);  
--            --//��ȡ�ֲ��㣬����õ�B  
--            b2Vec2 localPointB = m_proxyB->GetVertex(cache->indexB[0]);  
--            b2Vec2 pointB = b2Mul(xfB, localPointB);  
--            --//��ȡ���룬������  
--            float32 s = b2Dot(pointB - pointA, normal);  
--            if (s < 0.0f)  
--            {  
--                m_axis = -m_axis;  
--                s = -s;  
--            }  
--            return s;  
--        }  
--    }  
--    --[[************************************************************************** 
--    * ����������Ѱ����С���� 
--    * ����˵����indexA ����A������ 
--                indexB ����B������ 
--                t      ��ʱ��ֵ 
--    * �� �� ֵ�� ��С���� 
--    **************************************************************************/]]--  
--    function FindMinSeparation(int32* indexA, int32* indexB, float32 t) const  
--    {  
--        --//�����任A��B�����ڻ�ȡ��tʱ�����ôܸı任  
--        b2Transform xfA, xfB;  
--        m_sweepA.GetTransform(&xfA, t);  
--        m_sweepB.GetTransform(&xfB, t);  
--        --//����ͬ������  
--        switch (m_type)  
--        {  
--        case e_points:                                --//��  
--            {  
--                --//ͨ��ת����תm_axis��ȡ������֧�ŵ�ķ�������  
--                b2Vec2 axisA = b2MulT(xfA.q,  m_axis);  
--                b2Vec2 axisB = b2MulT(xfB.q, -m_axis);  
--                --//ͨ������������ȡ�ֲ����������  
--                *indexA = m_proxyA->GetSupport(axisA);  
--                *indexB = m_proxyB->GetSupport(axisB);  
--                --//ͨ��������ȡ�ֲ�����  
--                b2Vec2 localPointA = m_proxyA->GetVertex(*indexA);  
--                b2Vec2 localPointB = m_proxyB->GetVertex(*indexB);  
--                --//ͨ���任�ֲ����ȡ����״֮��Ķ���  
--                b2Vec2 pointA = b2Mul(xfA, localPointA);  
--                b2Vec2 pointB = b2Mul(xfB, localPointB);  
--                --//������״�ļ�࣬�����ء�  
--                float32 separation = b2Dot(pointB - pointA, m_axis);  
--                return separation;  
--            }  

--        case e_faceA:                              //��A  
--            {  
--                --//ͨ��ת����תm_axis��ȡ������֧�ŵ�ķ�������  
--                --//ͨ���任�ֲ����ȡ��ǰͼ�εĵ�  
--                b2Vec2 normal = b2Mul(xfA.q, m_axis);  
--                b2Vec2 pointA = b2Mul(xfA, m_localPoint);  
--                --//ͨ��ת����תm_axis��ȡ������֧�ŵ�ķ�������  
--                b2Vec2 axisB = b2MulT(xfB.q, -normal);  
--                --//ͨ��������ȡ�ֲ�����  
--                *indexA = -1;  
--                *indexB = m_proxyB->GetSupport(axisB);  
--                --//ͨ���任�ֲ������״B�Ķ���  
--                b2Vec2 localPointB = m_proxyB->GetVertex(*indexB);  
--                b2Vec2 pointB = b2Mul(xfB, localPointB);  
--                --//������״�ļ�࣬�����ء�  
--                float32 separation = b2Dot(pointB - pointA, normal);  
--                return separation;  
--            }  

--        case e_faceB:                             --//��B  
--            {  
--                --//ͨ��ת����תm_axis��ȡ������֧�ŵ�ķ�������  
--                --//ͨ���任�ֲ����ȡ��ǰͼ�εĵ�  
--                b2Vec2 normal = b2Mul(xfB.q, m_axis);  
--                b2Vec2 pointB = b2Mul(xfB, m_localPoint);  
--                --//ͨ��ת����תm_axis��ȡ������֧�ŵ�ķ�������  
--                b2Vec2 axisA = b2MulT(xfA.q, -normal);  
--                --//ͨ��������ȡ�ֲ�����  
--                *indexB = -1;  
--                *indexA = m_proxyA->GetSupport(axisA);  
--                --//ͨ���任�ֲ������״A�Ķ���  
--                b2Vec2 localPointA = m_proxyA->GetVertex(*indexA);  
--                b2Vec2 pointA = b2Mul(xfA, localPointA);  
--                --//������״�ļ�࣬�����ء�  
--                float32 separation = b2Dot(pointA - pointB, normal);  
--                return separation;  
--            }  

--        default:  
--            b2Assert(false);  
--            *indexA = -1;  
--            *indexB = -1;  
--            return 0.0f;  
--        }  
--    }  
--    --[[/************************************************************************** 
--    * ������������ǰʱ�䲽������״�ľ��� 
--    * ����˵����indexA ����A������ 
--                indexB ����B������ 
--                t      ��ʱ��ֵ 
--    * �� �� ֵ�� ��ǰʱ�䲽������״�ľ��� 
--    **************************************************************************/]]--
--    function Evaluate(int32 indexA, int32 indexB, float32 t) const  
--    {  
--        b2Transform xfA, xfB;  
--        m_sweepA.GetTransform(&xfA, t);  
--        m_sweepB.GetTransform(&xfB, t);  

--        switch (m_type)  
--        {  
--        case e_points:                                --//��  
--            {  
--                --//ͨ��ת����תm_axis��ȡ����ķ�������  
--                b2Vec2 axisA = b2MulT(xfA.q,  m_axis);  
--                b2Vec2 axisB = b2MulT(xfB.q, -m_axis);  
--                --//ͨ���任�ֲ������״A��B�Ķ���  
--                b2Vec2 localPointA = m_proxyA->GetVertex(indexA);  
--                b2Vec2 localPointB = m_proxyB->GetVertex(indexB);  
--                --//��ȡ��ǰʱ�䲽�ڵ�����״�ϵĵ�  
--                b2Vec2 pointA = b2Mul(xfA, localPointA);  
--                b2Vec2 pointB = b2Mul(xfB, localPointB);  
--                --//�����࣬�����ؼ��  
--                float32 separation = b2Dot(pointB - pointA, m_axis);  
--                return separation;  
--            }  

--        case e_faceA:                                 --//��A  
--            {  
--                //��תm_axis��������ȡ��������ͬʱ���ݾֲ�������״A�ϵĵ�  
--                b2Vec2 normal = b2Mul(xfA.q, m_axis);  
--                b2Vec2 pointA = b2Mul(xfA, m_localPoint);  
--                //ͨ��ת����תm_axis��ȡ������֧�ŵ�ķ�������  
--                b2Vec2 axisB = b2MulT(xfB.q, -normal);  
--                //ͨ��������ȡ�ֲ����㣬����ͨ���任�ֲ����ȡ��ǰʱ�䲽�ڵĵ�  
--                b2Vec2 localPointB = m_proxyB->GetVertex(indexB);  
--                b2Vec2 pointB = b2Mul(xfB, localPointB);  
--                //��ȡ���  
--                float32 separation = b2Dot(pointB - pointA, normal);  
--                return separation;  
--            }  

--        case e_faceB:                                 --//��B  
--            {  
--                --//��תm_axis��������ȡ��������ͬʱ���ݾֲ�������״B�ϵĵ�  
--                b2Vec2 normal = b2Mul(xfB.q, m_axis);  
--                b2Vec2 pointB = b2Mul(xfB, m_localPoint);  
--                --//ͨ��ת����תm_axis��ȡ������֧�ŵ�ķ�������  
--                b2Vec2 axisA = b2MulT(xfA.q, -normal);  
--                --//ͨ��������ȡ�ֲ����㣬����ͨ���任�ֲ����ȡ��ǰʱ�䲽�ڵĵ�  
--                b2Vec2 localPointA = m_proxyA->GetVertex(indexA);  
--                b2Vec2 pointA = b2Mul(xfA, localPointA);  
--                --//��ȡ���  
--                float32 separation = b2Dot(pointA - pointB, normal);  
--                return separation;  
--            }  

--        default:  
--            b2Assert(false);  
--            return 0.0f;  
--        }  
--    }  

--    const b2DistanceProxy* m_proxyA;          --//����A  
--    const b2DistanceProxy* m_proxyB;          --//����B  
--    b2Sweep m_sweepA, m_sweepB;               --//ɨ��A��B  
--    Type m_type;                              --//���ͱ���  
--    b2Vec2 m_localPoint;                      --//�ֲ���  
--    b2Vec2 m_axis;                            --//������������Ҫ���ڱ任������֮������״�Ķ���  
--};  

--return MainScene

