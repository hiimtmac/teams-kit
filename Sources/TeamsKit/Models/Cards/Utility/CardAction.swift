import Foundation

/// Defines a clickable action with a button.
public struct CardAction: Codable {
    /// Channel-specific data associated with this action.
    public let channelData: String?
    /// Text to display in the chat feed if the button is clicked.
    public let displayText: String?
    /// Image URL which will appear on the button, next to the text label.
    public let image: URL?
    /// Text for the action.
    public let text: String?
    /// Text description which appears on the button.
    public let title: String
    /// Type of action to perform.
    public let type: CardActionType
    /// Supplementary parameter for the action.
    /// The behavior of this property will vary according to the action type.
    /// For more information, see Add rich card attachments to messages.
    //https://github.com/Microsoft/botframework-sdk/blob/main/specs/botframework-activity/botframework-activity.md#message-back
//    let value: object
    
    public init(
        channelData: String?,
        displayText: String?,
        image: URL?,
        text: String?,
        title: String,
        type: CardActionType
    ) {
        self.channelData = channelData
        self.displayText = displayText
        self.image = image
        self.text = text
        self.title = title
        self.type = type
    }
}

extension CardAction {
    public enum CardActionType: String, Codable {
        /// URL to be opened in the built-in browser
        case openUrl
        /// Text of the message to send to the bot (from the user who clicked the button or tapped the card).
        /// This message (from user to bot) will be visible to all conversation participants via the client application that is hosting the conversation.
        case imBack
        /// Text of the message to send to the bot (from the user who clicked the button or tapped the card).
        /// Some client applications may display this text in the message feed, where it will be visible to all conversation participants.
        case postBack
        /// Destination for a phone call in this format: 123123123123
        case call
        /// URL of audio to be played
        case playAudio
        /// URL of video to be played
        case playVideo
        /// URL of image to be displayed
        case showImage
        /// URL of file to be downloaded
        case downloadFile
        /// URL of OAuth flow to be initiated
        case signin
    }
}
