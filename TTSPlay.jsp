<%@page language="java" pageEncoding="UTF-8" contentType="text/vxml; charset=UTF-8" %>
<?xml version="1.0" encoding="UTF-8" ?>
<vxml version="2.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.w3.org/2001/vxml http://www.w3.org/TR/2004/WD-voicexml21-20040728/vxml.xsd">
    
    <var name="CallID" expr=""/>
	<var name="CIDIfSound" expr=""/>
	<var name="dtmfKey" expr="''"/>
	<var name="InterferingSound" expr=""/>
	
    <!--欢迎语音-->
    <script>
        CallID = session.connection.callid;
    </script>
    <form id="one">
        <block>
			<assign name="InterferingSound" expr="'../voice/bgs/_PF_Tones28.wav'"/>
            <prompt>
                密碼處理中
            </prompt>
	    <goto next="#two" />
        </block>
    </form>
	
	<form id="two">
        <block>
            <prompt>
                您好
            </prompt>
			<goto next="#three" />
        </block>
    </form>
	
	<form id="three">
        <block>
			<prompt><audio src="../voice/Chinese/0.wav"/></prompt>
			<prompt>8.39</prompt>
			<prompt><audio src="../voice/Chinese/0.wav"/></prompt>
			<prompt>0.01</prompt>
			<prompt><audio src="../voice/Chinese/0.wav"/></prompt>
			<prompt>22.15</prompt>
			<prompt><audio src="../voice/Chinese/0.wav"/></prompt>
			<prompt>var:-num:M31</prompt>

			<goto next="#four" />
        </block>
    </form>
	
	<form id="four">
		
        <block>
            <prompt>
				<audio src="../voice/Chinese/00000015.wav"></audio>
            </prompt>
        </block>
        <field name="passdtmf">
            <property name="mindigit" value="1"/>
            <property name="maxdigit" value="17"/>
            <property name="timeout" value="5s"/>
			<property name="interdigittimeout" value="3s"/>
			<property name="bgs" expr="'/cc/bgs/_PF_Tones28.wav'" />
            <property name="termchar" value="#"/>
            <grammar mode="dtmf">builtin:dtmf</grammar>
            <filled>
                <assign name="dtmfKey" expr="passdtmf"/>
                <goto next="#judgdtmfKey"/>
            </filled>
        </field>
    </form>
	
	<form id="judgdtmfKey">
		<block>
			<if cond="dtmfKey=='1234'">				
				<goto next="#five"/>
			<else/>
				<goto next="#six"/>
			</if>
		</block>
	</form>	
	
	<form id="five">
        <block>
			<prompt><audio src="../voice/Chinese/0.wav"/></prompt>
			<prompt>var:-num:M32</prompt>

			<exit />
        </block>
    </form>
	
	<form id="six">
        <block>
			<prompt><audio src="../voice/Chinese/0.wav"/></prompt>
			<prompt>var:-num:M33</prompt>

			<exit />
        </block>
    </form>
</vxml>