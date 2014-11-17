//
//  Definitions.h
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 17/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#ifndef MobilIM_Definitions_h
#define MobilIM_Definitions_h


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
