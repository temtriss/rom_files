AttrEffect = class("AttrEffect")

-- AttrEffect=1	??????????????????  1 << 0
-- AttrEffect=2	??????????????????  1 << 1
-- AttrEffect=3	??????????????????  1 << 2
-- AttrEffect=4	??????????????????  1 << 3
-- AttrEffect=5	??????????????????  1 << 4
-- AttrEffect=6	??????????????????  1 << 5
-- AttrEffect=7	??????????????????  1 << 6
-- AttrEffect=8	??????????????????  1 << 7
-- AttrEffect=9	???????????????????????? 1 << 8
-- AttrEffect=10 ????????????????????? 1 << 9
-- AttrEffect=17 ????????????    1 << 16
-- AttrEffect=20 ????????????    1 << 19
-- AttrEffect=27 ????????????    1 << 26

function AttrEffect:ctor()
	self:Set(0)
end

function AttrEffect:Set(num)
 	self.behaviour = num
end

function AttrEffect:Get(flag)
	return BitUtil.bandOneZero(self.behaviour,flag)
end 

--??????????????????
function AttrEffect:MagicDamageInvincible()
	return self:Get(0) >0
end

--??????????????????
function AttrEffect:PhysicDamageInvincible()
	return self:Get(1) >0
end

--??????????????????
function AttrEffect:HpDisableRecover()
	return self:Get(2) >0
end

--??????????????????
function AttrEffect:MpDisableRecover()
	return self:Get(3) >0
end

--??????????????????
function AttrEffect:SingDisableInterrupt()
	return self:Get(4) >0
end

--??????????????????
function AttrEffect:IgnoreRaceDamage()
	return self:Get(5) >0
end

--??????????????????
function AttrEffect:IgnoreShapeDamage()
	return self:Get(6) >0
end

--??????????????????
function AttrEffect:IgnoreAttrDamage()
	return self:Get(7) >0
end

--????????????????????????
function AttrEffect:IgnoreJinzhanDamage()
	return self:Get(8) >0
end

--?????????????????????
function AttrEffect:DefiniteHitAndCritical()
	return self:Get(9) >0
end

--????????????
function AttrEffect:InvincibleState()
	return self:Get(19) >0
end

--????????????
function AttrEffect:BlindnessState()
	return self:Get(26) >0
end


AttrEffectB = class("AttrEffectB")

-- AttrEffectB=2	????????????????????????????????????x  1 << 1
-- AttrEffectB=8	??????????????????????????????  1 << 7
-- AttrEffectB=16	?????????????????????????????????  1 << 14

function AttrEffectB:ctor()
	self:Reset()
end

function AttrEffectB:Reset()
	self.value = 0
end

function AttrEffectB:Set(value)
	self.value = value
end

function AttrEffectB:NextPointTargetSkillLargeLaunchRange()
	return self.value & 2 > 0
end

function AttrEffectB:NextSkillNoReady()
	return self.value & 128 > 0
end

function AttrEffectB:CanNotBeSkillTargetByEnemy()
	return self.value & 32768 > 0
end