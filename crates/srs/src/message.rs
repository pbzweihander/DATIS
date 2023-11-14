use std::collections::HashMap;
use std::fmt;

use serde::{Deserialize, Serialize};
use serde_repr::{Deserialize_repr, Serialize_repr};
use uuid::Uuid;

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum MsgType {
    Update,
    Ping,
    Sync,
    RadioUpdate,
    ServerSettings,
    ClientDisconnect,
    VersionMismatch,
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum Coalition {
    Spectator,
    Blue,
    Red,
}

#[derive(Debug, Default, PartialEq, Clone, Serialize, Deserialize)]
pub struct Position {
    pub x: f64,
    #[serde(rename = "z")]
    pub y: f64,
    #[serde(rename = "y")]
    pub alt: f64,
}

#[derive(Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Radio {
    #[serde(default)]
    pub enc: bool,
    #[serde(default)]
    pub enc_key: u8,
    #[serde(default)]
    pub freq: f64,
    #[serde(default)]
    pub modulation: Modulation,
}

impl Default for Radio {
    fn default() -> Self {
        Radio {
            enc: false,
            enc_key: 0,
            freq: 0.0,
            modulation: Modulation::Disabled,
        }
    }
}

#[derive(Serialize_repr, Deserialize_repr, Debug, Clone, Copy)]
#[repr(u8)]
pub enum FreqMode {
    Cockpit = 0,
    Overlay = 1,
}

impl Default for FreqMode {
    fn default() -> Self {
        FreqMode::Cockpit
    }
}

#[derive(Serialize_repr, Deserialize_repr, Debug, Clone, Copy)]
#[repr(u8)]
pub enum Modulation {
    Am = 0,
    Fm = 1,
    Intercom = 2,
    Disabled = 3,
    HaveQuick = 4,
    Satcom = 5,
    Mids = 6,
}

impl Default for Modulation {
    fn default() -> Self {
        Modulation::Disabled
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct RadioInfo {
    pub radios: Vec<Radio>,
    #[serde(default)]
    pub unit: String,
    pub unit_id: u32,
}

#[derive(Serialize_repr, Deserialize_repr, Debug, Clone, Copy)]
#[repr(u8)]
pub enum RadioSwitchControls {
    Hotas = 0,
    InCockpit = 1,
}

impl Default for RadioSwitchControls {
    fn default() -> Self {
        RadioSwitchControls::Hotas
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
pub struct Client {
    pub client_guid: String,
    pub name: Option<String>,
    pub radio_info: Option<RadioInfo>,
    pub coalition: Coalition,
    pub lat_lng_position: Option<LatLngPosition>,
}

#[derive(Serialize, Deserialize, Debug, Clone, Default, PartialEq)]
pub struct LatLngPosition {
    pub lat: f64,
    pub lng: f64,
    pub alt: f64,
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "PascalCase")]
pub struct Message {
    pub client: Option<Client>,
    pub msg_type: MsgType,
    pub server_settings: Option<HashMap<String, String>>,
    // Clients
    // ServerSettings
    // ExternalAWACSModePassword
    pub version: String,
}

/// Data received from the in-game srs-plugin.
#[derive(Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct GameMessage {
    pub control: Option<i32>,
    pub name: String,
    pub lat_lng: LatLngPosition,
    pub ptt: bool,
    pub radios: Vec<Radio>,
    pub selected: i16,
    pub unit: String,
    pub unit_id: u32,
}

#[derive(Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Transponder {
    control: IffControlMode,
    mode1: i32,
    mode3: i32,
    mode4: bool,
    mic: i32,
    status: IffStatus,
}

#[derive(Serialize_repr, Deserialize_repr, Debug, Clone, Copy)]
#[repr(u8)]
pub enum IffControlMode {
    Cockpit = 0,
    Overlay = 1,
    Disabled = 2,
}

#[derive(Serialize_repr, Deserialize_repr, Debug, Clone, Copy)]
#[repr(u8)]
pub enum IffStatus {
    Off = 0,
    Normal = 1,
    Ident = 2,
}

impl Default for Transponder {
    fn default() -> Self {
        Transponder {
            control: IffControlMode::Disabled,
            mode1: -1,
            mode3: -1,
            mode4: false,
            mic: -1,
            status: IffStatus::Off,
        }
    }
}

impl ::serde::Serialize for MsgType {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: ::serde::Serializer,
    {
        // Serialize the enum as a u64.
        serializer.serialize_u64(match *self {
            MsgType::Update => 0,
            MsgType::Ping => 1,
            MsgType::Sync => 2,
            MsgType::RadioUpdate => 3,
            MsgType::ServerSettings => 4,
            MsgType::ClientDisconnect => 5,
            MsgType::VersionMismatch => 6,
        })
    }
}

impl<'de> ::serde::Deserialize<'de> for MsgType {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        struct Visitor;

        impl<'de> ::serde::de::Visitor<'de> for Visitor {
            type Value = MsgType;

            fn expecting(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
                formatter.write_str("positive integer")
            }

            fn visit_u64<E>(self, value: u64) -> Result<MsgType, E>
            where
                E: ::serde::de::Error,
            {
                // Rust does not come with a simple way of converting a
                // number to an enum, so use a big `match`.
                match value {
                    0 => Ok(MsgType::Update),
                    1 => Ok(MsgType::Ping),
                    2 => Ok(MsgType::Sync),
                    3 => Ok(MsgType::RadioUpdate),
                    4 => Ok(MsgType::ServerSettings),
                    5 => Ok(MsgType::ClientDisconnect),
                    6 => Ok(MsgType::VersionMismatch),
                    _ => Err(E::custom(format!(
                        "unknown {} value: {}",
                        stringify!(MsgType),
                        value
                    ))),
                }
            }
        }

        // Deserialize the enum from a u64.
        deserializer.deserialize_u64(Visitor)
    }
}

impl ::serde::Serialize for Coalition {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: ::serde::Serializer,
    {
        // Serialize the enum as a u64.
        serializer.serialize_u64(match *self {
            Coalition::Spectator => 0,
            Coalition::Red => 1,
            Coalition::Blue => 2,
        })
    }
}

impl<'de> ::serde::Deserialize<'de> for Coalition {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        struct Visitor;

        impl<'de> ::serde::de::Visitor<'de> for Visitor {
            type Value = Coalition;

            fn expecting(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
                formatter.write_str("positive integer")
            }

            fn visit_u64<E>(self, value: u64) -> Result<Coalition, E>
            where
                E: ::serde::de::Error,
            {
                // Rust does not come with a simple way of converting a
                // number to an enum, so use a big `match`.
                match value {
                    0 => Ok(Coalition::Spectator),
                    1 => Ok(Coalition::Red),
                    2 => Ok(Coalition::Blue),
                    _ => Err(E::custom(format!(
                        "unknown {} value: {}",
                        stringify!(Coalition),
                        value
                    ))),
                }
            }
        }

        // Deserialize the enum from a u64.
        deserializer.deserialize_u64(Visitor)
    }
}

pub fn create_sguid() -> String {
    let sguid = Uuid::new_v4();
    let sguid = base64::encode_config(sguid.as_bytes(), base64::URL_SAFE_NO_PAD);
    assert_eq!(sguid.len(), 22);
    sguid
}
