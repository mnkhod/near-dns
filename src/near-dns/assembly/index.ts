import {  PersistentMap } from "near-sdk-as";
import { storage, Context } from "near-sdk-as"

export const domainBox = new PersistentMap<string, string>("m");


export function getDomain(domainName: string): string|null {
    if(domainBox.contains(domainName)) {
      return "Already has that domain";
    }

    if(domainBox.get(domainName) == null){
      return "Not Found";
    }

    return domainBox.get(domainName);
}

export function setDomain(domainName: string,domainIPAddress: string): string {
    if(domainBox.contains(domainName)) {
      return "Already has that domain";
    }

    domainBox.set(domainName,domainIPAddress);
    return `Added "${domainName}" to "${domainIPAddress}" address`;
}

