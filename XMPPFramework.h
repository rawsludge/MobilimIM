//
//  XMPPFramework.h
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 08/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#ifndef MobilIM_XMPPFramework_h
#define MobilIM_XMPPFramework_h


#import "XMPP.h"

// List the modules you're using here.

#import "XMPPReconnect.h"

#import "XMPPRoster.h"
#import "XMPPRosterCoreDataStorage.h"

#import "XMPPvCardTempModule.h"
#import "XMPPvCardAvatarModule.h"
#import "XMPPvCardCoreDataStorage.h"

#import "XMPPCapabilities.h"
#import "XMPPCapabilitiesCoreDataStorage.h"

#import "XMPPMUC.h"
#import "XMPPRoomCoreDataStorage.h"

//Log informations
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "XMPPLogging.h"


// Log levels: off, error, warn, info, verbose
#if DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_INFO;
#endif


#endif
