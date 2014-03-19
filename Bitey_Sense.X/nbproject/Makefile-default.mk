#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c ../../libs/bitbang_HD44780/bitbang_HD44780.c ../../libs/std_digio/std_digio.c ../../libs/M74HC164B1_shift_register/M74HC164B1_shift_register.c ../../libs/std_string/std_string.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o ${OBJECTDIR}/_ext/91542677/std_digio.o ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o ${OBJECTDIR}/_ext/1897068078/std_string.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o.d ${OBJECTDIR}/_ext/91542677/std_digio.o.d ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o.d ${OBJECTDIR}/_ext/1897068078/std_string.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o ${OBJECTDIR}/_ext/91542677/std_digio.o ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o ${OBJECTDIR}/_ext/1897068078/std_string.o

# Source Files
SOURCEFILES=main.c ../../libs/bitbang_HD44780/bitbang_HD44780.c ../../libs/std_digio/std_digio.c ../../libs/M74HC164B1_shift_register/M74HC164B1_shift_register.c ../../libs/std_string/std_string.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX150F128B
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o: ../../libs/bitbang_HD44780/bitbang_HD44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/562458136 
	@${RM} ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o.d 
	@${RM} ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o.d" -o ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o ../../libs/bitbang_HD44780/bitbang_HD44780.c   
	
${OBJECTDIR}/_ext/91542677/std_digio.o: ../../libs/std_digio/std_digio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/91542677 
	@${RM} ${OBJECTDIR}/_ext/91542677/std_digio.o.d 
	@${RM} ${OBJECTDIR}/_ext/91542677/std_digio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/91542677/std_digio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/91542677/std_digio.o.d" -o ${OBJECTDIR}/_ext/91542677/std_digio.o ../../libs/std_digio/std_digio.c   
	
${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o: ../../libs/M74HC164B1_shift_register/M74HC164B1_shift_register.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2045227077 
	@${RM} ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o.d" -o ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o ../../libs/M74HC164B1_shift_register/M74HC164B1_shift_register.c   
	
${OBJECTDIR}/_ext/1897068078/std_string.o: ../../libs/std_string/std_string.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1897068078 
	@${RM} ${OBJECTDIR}/_ext/1897068078/std_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1897068078/std_string.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1897068078/std_string.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/1897068078/std_string.o.d" -o ${OBJECTDIR}/_ext/1897068078/std_string.o ../../libs/std_string/std_string.c   
	
else
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o: ../../libs/bitbang_HD44780/bitbang_HD44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/562458136 
	@${RM} ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o.d 
	@${RM} ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o.d" -o ${OBJECTDIR}/_ext/562458136/bitbang_HD44780.o ../../libs/bitbang_HD44780/bitbang_HD44780.c   
	
${OBJECTDIR}/_ext/91542677/std_digio.o: ../../libs/std_digio/std_digio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/91542677 
	@${RM} ${OBJECTDIR}/_ext/91542677/std_digio.o.d 
	@${RM} ${OBJECTDIR}/_ext/91542677/std_digio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/91542677/std_digio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/91542677/std_digio.o.d" -o ${OBJECTDIR}/_ext/91542677/std_digio.o ../../libs/std_digio/std_digio.c   
	
${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o: ../../libs/M74HC164B1_shift_register/M74HC164B1_shift_register.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2045227077 
	@${RM} ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o.d" -o ${OBJECTDIR}/_ext/2045227077/M74HC164B1_shift_register.o ../../libs/M74HC164B1_shift_register/M74HC164B1_shift_register.c   
	
${OBJECTDIR}/_ext/1897068078/std_string.o: ../../libs/std_string/std_string.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1897068078 
	@${RM} ${OBJECTDIR}/_ext/1897068078/std_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1897068078/std_string.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1897068078/std_string.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../libs/M74HC164B1_shift_register" -I"../../libs/bitbang_HD44780" -I"../../libs/std_digio" -I"../../libs/std_string" -MMD -MF "${OBJECTDIR}/_ext/1897068078/std_string.o.d" -o ${OBJECTDIR}/_ext/1897068078/std_string.o ../../libs/std_string/std_string.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Bitey_Sense.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
