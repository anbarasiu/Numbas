{% raw %}
<xsl:template match="choices" mode="one">
	<xsl:variable name="displaytype"><xsl:value-of select="@displaytype"/></xsl:variable>
	<form>
	<xsl:choose>
		<xsl:when test="@displaytype='radiogroup'">
			<ul class="multiplechoice clearfix">
				<xsl:apply-templates select="choice" mode="radiogroup"/>
			</ul>
		</xsl:when>
		<xsl:when test="@displaytype='checkbox'">
			<ul class="multiplechoice clearfix">
				<xsl:apply-templates select="choice" mode="checkbox"/>
			</ul>
		</xsl:when>
		<xsl:when test="@displaytype='dropdownlist'">
			<select class="multiplechoice" data-bind="value: studentAnswer, disable: revealed">
				<option value=""></option>
				<xsl:apply-templates select="choice" mode="dropdownlist"/>
			</select>
		</xsl:when>
	</xsl:choose>
	</form>
</xsl:template>

<xsl:template match="choices" mode="correctanswer">
	<xsl:variable name="displaytype"><xsl:value-of select="@displaytype"/></xsl:variable>
	<form>
	<xsl:choose>
		<xsl:when test="@displaytype='radiogroup'">
			<ul class="multiplechoice clearfix">
				<xsl:apply-templates select="choice" mode="radiogroup-correctanswer"/>
			</ul>
		</xsl:when>
		<xsl:when test="@displaytype='checkbox'">
			<ul class="multiplechoice clearfix">
				<xsl:apply-templates select="choice" mode="checkbox-correctanswer"/>
			</ul>
		</xsl:when>
		<xsl:when test="@displaytype='dropdownlist'">
			<select class="multiplechoice" data-bind="value: correctAnswer" disabled="true">
				<option value=""></option>
				<xsl:apply-templates select="choice" mode="dropdownlist-correctanswer"/>
			</select>
		</xsl:when>
	</xsl:choose>
	</form>
</xsl:template>

<xsl:template match="choice" mode="radiogroup">
	<xsl:variable name="cols" select="../@displaycolumns"/>
	
	<xsl:variable name="choicenum"><xsl:value-of select="count(preceding-sibling::choice)"/></xsl:variable>

	<li>
		<xsl:attribute name="class">
			<xsl:if test="($choicenum mod $cols = 0) and ($cols>0)">
				<xsl:text>start-column</xsl:text>
			</xsl:if>
		</xsl:attribute>
		<label>
			<input type="radio" class="choice" name="choice" data-bind="checked: studentAnswer, disable: revealed" value="{$choicenum}"/>
			<xsl:apply-templates select="content"/>
		</label>
	</li>
</xsl:template>
<xsl:template match="choice" mode="radiogroup-correctanswer">
	<xsl:variable name="cols" select="../@displaycolumns"/>
	
	<xsl:variable name="choicenum"><xsl:value-of select="count(preceding-sibling::choice)"/></xsl:variable>

	<li>
		<xsl:attribute name="class">
			<xsl:if test="($choicenum mod $cols = 0) and ($cols>0)">
				<xsl:text>start-column</xsl:text>
			</xsl:if>
		</xsl:attribute>
		<label>
			<input type="radio" class="choice" name="choice" data-bind="checked: correctAnswer()+''" disabled="true" value="{$choicenum}"/>
			<xsl:apply-templates select="content"/>
		</label>
	</li>
</xsl:template>

<xsl:template match="choice" mode="checkbox">
	<xsl:variable name="cols" select="../@displaycolumns"/>

	<xsl:variable name="choicenum"><xsl:value-of select="count(preceding-sibling::choice)"/></xsl:variable>

	<li>
		<xsl:attribute name="class">
			<xsl:if test="($choicenum mod $cols = 0) and ($cols>0)">
				<xsl:text>start-column</xsl:text>
			</xsl:if>
		</xsl:attribute>
		<label>
			<input type="checkbox" class="choice" name="choice" data-bind="checked: ticks[{$choicenum}], disable: revealed" />
			<xsl:apply-templates select="content"/>
		</label>
	</li>
</xsl:template>

<xsl:template match="choice" mode="checkbox-correctanswer">
	<xsl:variable name="cols" select="../@displaycolumns"/>

	<xsl:variable name="choicenum"><xsl:value-of select="count(preceding-sibling::choice)"/></xsl:variable>

	<li>
		<xsl:attribute name="class">
			<xsl:if test="($choicenum mod $cols = 0) and ($cols>0)">
				<xsl:text>start-column</xsl:text>
			</xsl:if>
		</xsl:attribute>
		<label>
			<input type="checkbox" class="choice" name="choice" data-bind="checked: correctTicks[{$choicenum}]" disabled="true" />
			<xsl:apply-templates select="content"/>
		</label>
	</li>
</xsl:template>

<xsl:template match="choice" mode="dropdownlist">
	
	<xsl:variable name="choicenum"><xsl:value-of select="count(preceding-sibling::choice)"/></xsl:variable>
	<option value="{$choicenum}">
		<xsl:apply-templates select="content"/>
	</option>
</xsl:template>

<xsl:template match="choice" mode="dropdownlist-correctanswer">
	
	<xsl:variable name="choicenum"><xsl:value-of select="count(preceding-sibling::choice)"/></xsl:variable>
	<option value="{$choicenum}">
		<xsl:apply-templates select="content"/>
	</option>
</xsl:template>

<xsl:template match="distractor">
	<span><xsl:apply-templates /></span>
</xsl:template>
{% endraw %}
