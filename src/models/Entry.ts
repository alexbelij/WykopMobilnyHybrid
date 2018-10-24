import { Embed } from "./Embed"
import { Author } from "./Author"

export interface Entry {
    id: number
    body: String
    date: Date
    voteCount: number
    commentsCount: number
    author: Author
    embed: Embed | null
}