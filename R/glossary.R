#' Glossary of Terms
#'
#' \strong{Account}
#' An object that defines the details of your Account, including privileges,
#' purchased options, and Message limits. Resellers have sub-accounts which
#' they assign to customers.
#'
#' \strong{Account Owner}
#' The User who has administrative access to the Account.
#'
#' \strong{Activated}
#' An activated Contact receives Messages from the system. Its \code{is_active
#' Field is set to \emph{1}.
#'
#' \strong{Application Programming Interface (API)}
#' The library of routines and objects that your system uses to share data with
#' third party systems and to perform internal operations.
#'
#' \strong{API Key}
#' A code that is generated for you that enables you to access the API. The API
#' Key is always the first parameter in a method call.
#'
#' \strong{API Server}
#' The server that processes API calls and sends API requests.
#'
#' \strong{API Client Libraries}
#' XML-RPC or JSON-RPC implementations that call API methods.
#'
#' \strong{Associative Array}
#' An array made up of key => value pairs. In an associative array, the key
#' remains constant, but the value may change. All object arrays in the system
#' are associative arrays and therefore contain data in a Field => value format
#' (where Field is the key) as shown in the following Batch array
#' 
#' `array
#'     (array
#'     ('list_id'     => '1234567',
#'     'type'         => 'contacts',
#'     'contact_list' => array(2),
#'     'time'         => 'now'))`
#' For more information about Associative Arrays, see Basic Structure of the
#' API.
#'
#' \strong{Autoresponder}
#' A Message configured to be sent automatically to one or more Contacts when a
#' particular event occurs. For example, you may configure a thank you
#' Autoresponder to be sent to a Contact after the Contact subscribes to your
#' site.
#'
#' \strong{Batch}
#' An object whose definition includes a Message, the recipients' Email or SMS
#' addresses, and instructions for sending the Message. The Batch Message is
#' sent to its recipients at a scheduled or optimal time.
#'
#' \strong{Bounced}
#' A bounced Message gets through an Email or SMS server but cannot reach the
#' address.
#'
#' \strong{Campaign}
#' An object that defines a group of related steps. Each step includes rules
#' that specify when a system event causes the system to send a particular
#' Message to a specified User.
#'
#' \strong{Click Through Rate (CTR)}
#' For a group of Messages delivered, the amount of times recipients have
#' clicked links within the Messages.
#'
#' \strong{Confirm}
#' A Contact's verification of a subscription request. The Contact clicks a
#' link in a Message to verify that they have subscribed to your website. Also
#' called \emph{Double Opt In}.
#'
#' \strong{Contact}
#' An object specifying the unique ID and Email address of an individual in
#' your system. All Contacts are stored in Lists, and you may add any Fields
#' from the List to the Contact record.
#'
#' \strong{Contact List}
#' An object consisting of an array that includes one or more Contacts in your
#' Account. Usually Lists include Contacts of a similar category or function,
#' such as \emph{NSW Region} or \emph{Newsletter Subscriber}.
#'
#' \strong{Deactivated}
#' A deactivated Contact does not receive Messages from the system; however; it
#' is not unsubscribed and does not appear on the Unsubscriber List. When a
#' Contact is deactivated, its \code{is_active} Field is set to \emph{0}.
#' The system automatically deactivates a Contact if Messages sent to it bounce
#' 3 subsequent times because its Mail address is non-existent or disabled. You
#' can deactivate a Contact at any time.
#'
#' \strong{Details}
#' The data held in an object's Fields. We refer to the object information that
#' a method returns as a \emph{detail array}.
#'
#' \strong{Double Opt In}
#' See \emph{Confirm}.
#'
#' \strong{Duplicate}
#' A Contact with the same Email or SMS Address as another Contact.
#'
#' \strong{Email}
#' An object defining a Message sent electronically over a computer network.
#'
#' \strong{Field}
#' An object defining one piece of data in a List or Contact. For example
#' \emph{First Name}.
#'
#' \strong{File}
#' An object that defines Images or documents that are stored in the system.
#'
#' \strong{Folder}
#' An object representing a Container for Lists, Messages, or Files. Folders
#' enable you to group objects into categories. For example, you could have a
#' Folder for image Files named \emph{Images} and a Folder for document Files
#' named \emph{Documents}.
#'
#' \strong{Implementation (for XML-RPC or JSON-RPC):}
#' A set of XML-RPC or JSON-RPC functions in a programming language, such as
#' PHP or Java. An implementation enables you to create the XML-RPC or JSON-RPC
#' clients that call the functions as well as the servers that execute them.
#'
#' \strong{JSON-RPC}
#' One of the protocols that is used to transfer data between your internal and
#' external systems. You can also use XML-RPC.
#'
#' \strong{Library (for XML-RPC or JSON-RPC)}
#' The set of XML-RPC or JSON-RPC functions that are part of a particular
#' implementation.
#'
#' \strong{List}
#' See \emph{Contact List}.
#'
#' \strong{Message}
#' An Email or SMS (text message) object.
#'
#' \strong{Multidimensional Array}
#' An array that contains one or more additional arrays. See Basic Structure of
#' the API for more information.
#'
#' \strong{Notification}
#' A Message sent to inform a User or Contact that a certain event has occurred
#' such as a Subscriber confirmation.
#'
#' \strong{Object}
#' Item type in the system defined by:
#' \itemize{
#'   \item an array of Fields
#'   \item one or more API Methods that can perform operations on it.
#' }
#'
#' For example, Lists, Contacts, and Messages are types of objects.
#'
#' When an item of an object type is created it is an instance of the object.
#' For example, Lists and Contacts are types of objects, but the Loyal Customer
#' List and Contact 147 are instances of objects.
#'
#' \strong{Object Array}
#' An associative array of \code{Field=>value} pairs that define an instance of
#' an object. Some object arrays are multidimesional and others are singlular.
#' See Basic Structure of the API for more information about types of arrays
#' that define objects.
#'
#' \strong{PHP}
#' Computer language that the implementations of XML-RPC and JSON-RPC examples
#' in this documentation use. For information about PHP see
#' \url{http://www.w3schools.com/php/default.asp}
#'
#' \strong{Previously Unsubscribed}
#' All Contacts on the Unsubscriber List, both those who have been resubscribed
#' and those who are still unsubscribed.
#'
#' \strong{Protocol}
#' A set of rules and formats that define a method of transferring digital data
#' between two systems so they can share information. Your system uses the
#' protocols XML-RPC and JSON-RPC to transfer information.
#'
#' \strong{Reactivate}
#' Reverse a Contact's deactivated state. Reactivating a Contact changes the
#' value of its \code{is_active} Field from \emph{0} to \emph{1} and enables
#' the Contact to receive Messages again.
#'
#' \strong{Request}
#' A call from a client in XML-RPC or JSON-RPC that asks your system to return
#' information or to perform a task.
#'
#' \strong{Response}
#' The data that your system sends through XML-RPC or JSON-RPC. The data may be
#' requested information or a value indicating that its attempt to execute the
#' request was successful or failed.
#'
#' \strong{Reseller}
#' Company that that sells sub-accounts of our product.
#'
#' \strong{Resubscribe}
#' Change an unsubscribed Contact's status so it is subscribed to its List
#' again. The Contact remains on the Unsubscriber List.
#'
#' \strong{Search Array}
#' An array the specifies search criteria in a method that can perform a
#' search. Search arrays are multidimensional and the array(s) they contain
#' appear in the format: \code{(array(field name, relational operator, value)}
#' For example: \code{(array(estatement, not, 1)}. For more information, see
#' Using Search Methods.
#'
#' \strong{Search Criteria}
#' Conditional statements for selecting records to use in a method. See Search
#' Array, above, for the format of search criteria in a method.
#'
#' \strong{Single Object Array}
#' An object array that is not a container of arrays. For example, List objects
#' are single object arrays.
#'
#' \strong{SMS}
#' A text message transmitted to a mobile device.
#'
#' \strong{Statistics}
#' Information that shows Contacts' responses to Messages. For example, 10
#' Contacts left the Message unopened, and 15 Contacts clicked a link it it.
#'
#' \strong{Sub-Account}
#' Used by resellers only. An Account that you create for a customer when you
#' are logged into your Account. You have access to the sub-Account and can
#' change its privileges and deactivate it.
#'
#' \strong{Subscribe}
#' Register to receive Messages from a List (most likely through a website).
#'
#' \strong{Subscriber}
#' One of a List's Contacts who is able to receive Messages.
#'
#' \strong{Trial Account}
#' A free Account that is active for a specified amount of time.
#'
#' \strong{Trigger}
#' An event that causes an Autoresponder or Campaign Message to be sent.
#'
#' \strong{Unsubscribe}
#' Remove a Contact's subscription to a specific List (unsubscribe by Contact
#' ID) or remove a Contact's subscription to all Lists in the system
#' (unsubscribe by Email/SMS address.) Once unsubscribed the Contact remains on
#' the Lists it is unsubscribed from but does not receive messages sent to the
#' Lists.
#'
#' In addition, once unsubscribed, a Contact is placed on the Unsubscriber
#' List. By default, if a Contact appears on this List, the Contact is not
#' reuploaded; however, you can change this setting.
#' 
#' You can unsbuscribe Contacts or they can unsubscribe themselves.
#'
#' \strong{Unsubscriber}
#' A Contact who is no longer subscribed to to a specific List or is no longer
#' subscribed to all Lists in the system. Unsubscribed Contacts remain on their
#' Lists but do not receive Messages sent to the Lists and appear on the
#' Unsubscriber List, which prevents them, by default, from being reuploaded
#' into the system.
#'
#' \strong{Unsubscriber List}
#' A list of Contacts who have been unsubscribed from any Lists in the system.
#' Some of these Contacts may be resubscribed to the system, but they remain on
#' the Unsubscriber List. By default, Contacts on the Unsubscriber List are not
#' re-uploaded. The only way to remove a Contact from the Unsubscriber List is
#' through the user interface.
#'
#' \strong{User}
#' An object defining an individual who has access to one or more Accounts or
#' sub-Accounts.
#'
#' \strong{User Account}
#' See User.
#'
#' @name glossary
#' @docType info
#' @title SLP Codes
NULL


