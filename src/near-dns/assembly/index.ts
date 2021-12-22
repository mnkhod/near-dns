import { Context, PersistentMap } from "near-sdk-as"

export const domainBox = new PersistentMap<string, string>("m");
export const owner:string = Context.sender;


export function getDomain(domainName: string): string|null {
    if(!domainBox.contains(domainName)) {
      return "Domain doesnt have any address";
    }

    return domainBox.get(domainName);
}

export function setDomain(domainName: string,domainIPAddress: string): string {
    if(domainBox.contains(domainName)) {
      return "Domain already has an address";
    }

    domainBox.set(domainName,domainIPAddress);
    return `Added "${domainName}" to "${domainIPAddress}" address`;
}

export function overwriteDomain(domainName: string,domainIPAddress: string): string {
    assert(Context.sender == owner, "Must Be Owner.");

    domainBox.set(domainName,domainIPAddress);
    return `Overwritten "${domainName}" to "${domainIPAddress}" address`;
}

