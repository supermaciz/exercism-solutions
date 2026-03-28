use std::fmt;
use std::fmt::{Debug, Formatter};

pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes = hours * 60 + minutes;
        let normalized_minutes = total_minutes.checked_rem_euclid(1440).unwrap_or(0);

        Self {
            hours: normalized_minutes / 60,
            minutes: normalized_minutes % 60,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let total_minutes = self.hours * 60 + self.minutes + minutes;
        let normalized_minutes = total_minutes.checked_rem_euclid(1440).unwrap_or(0);

        Self {
            hours: normalized_minutes / 60,
            minutes: normalized_minutes % 60,
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.hours == other.hours && self.minutes == other.minutes
    }
}

impl Debug for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        self.to_string().fmt(f)
    }
}
